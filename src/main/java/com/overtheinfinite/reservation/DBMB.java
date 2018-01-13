package main.java.com.overtheinfinite.reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBMB {
	private Connection conn;
	public DBMB() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost",
					"NormalUser", "NormalUser");
			execute("use productmanager;");
		} catch (SQLException e) {
			throw new LoginException(e);
		} catch (ClassNotFoundException e) {
			throw new LoginException(e);
		}
	}
	
	public PreparedStatement makeStatement(String sql, Object...args) throws SQLException {
		PreparedStatement p = conn.prepareStatement(sql);
		for(int i = 0; i < args.length; i++) {
			Object arg = args[i];
			if(arg instanceof String) {
				p.setString(i+1, arg.toString());
			}
			else if(arg instanceof Integer){
				p.setInt(i+1, (Integer) arg); 
			}
		}
		return p;
	}
	
	public ResultSet query(String sql, Object...args) throws SQLException {
		PreparedStatement p = makeStatement(sql, args);
		return p.executeQuery();
	}
	
	public void execute(String sql, Object...args) throws SQLException {
		PreparedStatement p = makeStatement(sql, args);
		p.execute();
	}
	
	public class LoginException extends RuntimeException {
		public LoginException(Throwable t) {
			super("DB�� �α��� �ϴ� �� ������ �߻��߽��ϴ�.", t);
		}
	}
}
