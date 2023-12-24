
package top.stu.musicsystem.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import top.stu.musicsystem.service.RecordDownloadService;

@Controller
public class DownloadController {
	@Autowired
	private RecordDownloadService recordDownloadService;

	public DownloadController() {
	}

	@RequestMapping(
			value = {"download.do"},
			method = {RequestMethod.GET}
	)
	public void download(HttpServletRequest request, HttpServletResponse response, String songAddress, int songId) throws IOException {
		this.recordDownloadService.recordDownload(request, songId);
		response.setContentType("audio/mp3");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(songAddress.substring(songAddress.lastIndexOf("/")), "utf-8"));
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		InputStream bis = null;
		if (songAddress.contains("http")) {
			URL url = new URL(songAddress);
			URLConnection uc = url.openConnection();
			bis = new BufferedInputStream(uc.getInputStream());
		} else {
			songAddress = request.getServletContext().getRealPath(songAddress);
			bis = new BufferedInputStream(new FileInputStream(new File(songAddress)));
		}

		int len = 0;

		while((len = bis.read()) != -1) {
			out.write(len);
			out.flush();
		}

		out.close();
		bis.close();
	}
}
