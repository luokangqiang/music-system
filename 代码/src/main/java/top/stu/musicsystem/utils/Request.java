package top.stu.musicsystem.utils;

import javax.servlet.http.HttpServletRequest;

import top.stu.musicsystem.model.User;

public class Request {
	
	public static User getUserFromHttpServletRequest(HttpServletRequest request) {
		return (User) request.getSession().getAttribute("user");
	}

}
