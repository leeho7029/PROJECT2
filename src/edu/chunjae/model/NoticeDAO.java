package edu.chunjae.model;

import edu.chunjae.db.DBC;
import edu.chunjae.db.MariaDBCon;
import edu.chunjae.dto.Notice;
import edu.chunjae.db.MariaDBCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class NoticeDAO {
  static DBC db = new MariaDBCon();
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  final static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

  public NoticeDAO() {
  }

  public List<Notice> getNoticeList(){
    conn = db.connect();
    List<Notice> noticeList = new ArrayList<>();
    String sql = "select * from notice order by regdate desc";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
        noticeList.add(new Notice(rs.getInt("no"), rs.getString("title"), rs.getString("content"), sdf.format(rs.getDate(("regdate"))), rs.getInt("visited")));
      }

    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return noticeList;
  }

  public Notice getNotice(int no){
    conn = db.connect();
    Notice notice = new Notice();

    String sql = "select * from notice where no=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, no);
      rs = pstmt.executeQuery();

      if(rs.next()){
        notice = new Notice(rs.getInt("no"), rs.getString("title"), rs.getString("content"), sdf.format(rs.getDate(("regdate"))), rs.getInt("visited"));
      }

    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return notice;
  }

  public int addNotice(Notice notice){
    int cnt = 0;

    conn = db.connect();
    String sql = "insert into notice(title, content) values(?, ?)";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, notice.getTitle());
      pstmt.setString(2, notice.getContent());
      cnt = pstmt.executeUpdate();

    } catch (SQLException e) {
      throw new RuntimeException(e);
    }

    db.close(rs, pstmt, conn);

    return cnt;
  }

  public int updateNotice(Notice notice){
    int cnt = 0;

    conn = db.connect();
    String sql = "update notice set title=?, content=? where no=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, notice.getTitle());
      pstmt.setString(2, notice.getContent());
      pstmt.setInt(3, notice.getNo());
      cnt = pstmt.executeUpdate();

    } catch (SQLException e) {
      throw new RuntimeException(e);
    }

    db.close(rs, pstmt, conn);

    return cnt;
  }

  public int deleteNotice(int no){
    int cnt = 0;

    conn = db.connect();
    String sql = "delete from notice where no=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, no);
      cnt = pstmt.executeUpdate();

    } catch (SQLException e) {
      throw new RuntimeException(e);
    }

    db.close(rs, pstmt, conn);

    return cnt;
  }

  public int countUp(int no){
    int cnt = 0;
    conn = db.connect();
    Notice notice = new Notice();

    String sql = "update notice set visited = visited+1 where no=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, no);
      cnt = pstmt.executeUpdate();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }

  public int getCount(){
    int cnt = 0;
    conn = db.connect();

    if(conn!=null){
      System.out.println("PostgreSQL 연결 성공");
    }
    try {
      String sql = "select count(*) as cnt from notice";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      if(rs.next()){
        cnt = rs.getInt("cnt");
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally {
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }

  public int getCount(String searchType, String kwd){
    int cnt = 0;
    conn = db.connect();
    String sql1 ="select count(*) as cnt from notice where title like ?";
    String sql2 ="select count(*) as cnt from notice where content like ?";
    String sql3 ="select count(*) as cnt from notice where title like ? or content like ?";

    if(conn!=null){
      System.out.println("PostgreSQL 연결 성공");
    }

    try {
      if(searchType.equals("title")) {
        pstmt = conn.prepareStatement(sql1);
        pstmt.setString(1, "%" + kwd + "%");
      } else if(searchType.equals("content")){
        pstmt = conn.prepareStatement(sql2);
        pstmt.setString(1, "%" + kwd + "%");
      } else {
        pstmt = conn.prepareStatement(sql3);
        pstmt.setString(1, "%" + kwd + "%");
        pstmt.setString(2, "%" + kwd + "%");
      }
      rs = pstmt.executeQuery();
      if(rs.next()){
        cnt = rs.getInt("cnt");
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally {
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }

  public List<Notice> getNoticeList(String searchType, String kwd, int no) {
    List<Notice> notiList = new ArrayList<>();
    String sql1 = "select * from notice where title like ? order by regdate desc limit 5 offset ?";
    String sql2 ="select * from notice where content like ? order by regdate desc limit 5 offset ?";
    String sql3 = "select * from notice where title like ? or content like ? order by regdate desc limit 5 offset ?";
    try {
      conn = db.connect();
      if(searchType.equals("title")) {
        pstmt = conn.prepareStatement(sql1);
        pstmt.setString(1, "%"+kwd+"%");
        pstmt.setInt(2, no);
      } else if(searchType.equals("content")){
        pstmt = conn.prepareStatement(sql2);
        pstmt.setString(1, "%"+kwd+"%");
        pstmt.setInt(2, no);
      } else {
        pstmt = conn.prepareStatement(sql3);
        pstmt.setString(1, "%"+kwd+"%");
        pstmt.setString(2, "%"+kwd+"%");
        pstmt.setInt(3, no);
      }
      rs = pstmt.executeQuery();
      while(rs.next()){
        Notice noti = new Notice();
        noti.setNo(rs.getInt("no"));
        noti.setTitle(rs.getString("title"));
        noti.setContent(rs.getString("content"));
        noti.setregdate(rs.getString("regdate"));
        noti.setVisited(rs.getInt("visited"));
        notiList.add(noti);
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally {
      db.close(rs, pstmt, conn);
    }
    return notiList;
  }

  public List<Notice> getNoticeList(int no){
    List<Notice> notiList = new ArrayList<>();

    try {
      conn = db.connect();
      String sql ="select * from notice order by no desc limit 5 offset ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, no);
      rs = pstmt.executeQuery();
      while(rs.next()){
        Notice noti = new Notice();
        noti.setNo(rs.getInt("no"));
        noti.setTitle(rs.getString("title"));
        noti.setContent(rs.getString("content"));
        noti.setregdate(rs.getString("regdate"));
        noti.setVisited(rs.getInt("visited"));
        notiList.add(noti);
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally {
      db.close(rs, pstmt, conn);
    }
    return notiList;
  }


}
