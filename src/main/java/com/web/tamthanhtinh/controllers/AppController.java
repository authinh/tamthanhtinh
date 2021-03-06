package com.web.tamthanhtinh.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.tamthanhtinh.engine.FacadeEngine;
import com.web.tamthanhtinh.model.Albums;
import com.web.tamthanhtinh.model.Category;
import com.web.tamthanhtinh.model.CategoryAlbum;
import com.web.tamthanhtinh.model.MusicAlbum;
import com.web.tamthanhtinh.model.Musics;
import com.web.tamthanhtinh.model.Sessions;
import com.web.tamthanhtinh.service.AlbumsServiceImpl;
import com.web.tamthanhtinh.service.CategoryServiseImpl;
import com.web.tamthanhtinh.service.serviceinterface.AlbumService;
import com.web.tamthanhtinh.service.serviceinterface.CategoryService;
import com.web.tamthanhtinh.service.serviceinterface.MusicAlbumService;
import com.web.tamthanhtinh.service.serviceinterface.MusicsService;
import com.web.tamthanhtinh.service.serviceinterface.SessionService;

@Controller
public class AppController {

	static public final Logger logger = LoggerFactory.getLogger(AppController.class);

	@Autowired
	private SessionService sessionService;
	@Autowired
	private CategoryService categoryServise;
	@Autowired
	private AlbumService albumService;
	@Autowired
	private MusicAlbumService musicAlbumService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		logger.debug("maping requestmaping: / ");
		logger.debug(categoryServise.findAll().toString());
		// get html by url
		model.addAttribute("background", "https://static.pexels.com/photos/50594/sea-bay-waterfront-beach-50594.jpeg");
		logger.debug("==========get html header===========");
		getCommonJSP(model);
		model.addAttribute("getContainer", FacadeEngine.getHtmlbyURL("homepage"));
		return "webpage";

	}

	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String category(ModelMap model, @RequestParam("categoryID") String categoryID) {
		logger.debug("maping requestmaping: / ");
		logger.debug(categoryServise.findAll().toString());
		// get html by url
		
		logger.debug("==========get html header===========");
		Category category = categoryServise.findOne(Integer.parseInt(categoryID));
		
		getCommonJSP(model);
		model.addAttribute("background", category.getBackgroundURL());
		model.addAttribute("getContainer", FacadeEngine.getHtmlbyURL("categorypage?categoryID="+categoryID));
		return "webpage";

	}
	
	@RequestMapping(value = "/description", method = RequestMethod.GET)
	public String description(ModelMap model, @RequestParam("albumID") String albumID)  {
		logger.debug("maping requestmaping: / ");
		
		// get html by url
		getCommonJSP(model);
		model.addAttribute("getContainer", FacadeEngine.getHtmlbyURL("descriptionpage?albumID="+albumID));
		return "webpage";

	}
	
	@RequestMapping(value = "/player", method = RequestMethod.GET)
	public String player(ModelMap model, @RequestParam("albumID") String albumID)  {
		String url = "error";
		
		try {
			int id = Integer.parseInt(albumID);
			Albums album = new Albums();
			album.setId(id);
			Iterable<MusicAlbum> listMusicAlbum = musicAlbumService.findByAlbum(album);
			List<Musics> listMusic = new ArrayList<Musics>();
			for (MusicAlbum musicAlbum : listMusicAlbum) {
				listMusic.add(musicAlbum.getMusic());
			}

			if (listMusic.size()>1){
				model.addAttribute("music",FacadeEngine.getHtmlbyURL("api/listaudio?albumID="+albumID));
				
				url = "listplayer";
				// need to edit in the futer
			} else{
				url =  "player";
				model.addAttribute("music",listMusic.get(0));
			}
			logger.debug("listMusic.size():"+listMusic.size());
			

		} catch (NumberFormatException e) {
			model.addAttribute("error", "NumberFormatException");
			url = "error";
		} catch (Exception e) {
			model.addAttribute("error", "error form alumid:" +albumID);
			url = "error";
		} finally {
			return url;
		}
		// get html by url
		
		

	}

	/*
	 * count number of views on server in a day
	 */
	@RequestMapping(value = "/countviews", method = RequestMethod.GET)
	public String countviewrs(@RequestParam("sessionCurrent") String sessionCurrent, @RequestParam("URL") String URL) {
		if (sessionCurrent != null) {
			Sessions sessions = new Sessions();
			logger.debug("Redirect URL: " + URL);
			System.out.println("Redirect URL: " + URL);
			sessions.setId(sessionCurrent);
			sessions.setOnlTime(new Date());
			sessions.setUserID(null);
			// save session into database. this line comment for issue
			//sessionService.save(sessions);

			return "redirect:" + URL;

		}
		return "homepage";
	}

	@RequestMapping(value = "/header", method = RequestMethod.GET)
	public String header(ModelMap model) {

		logger.debug(categoryServise.findAll().toString());
		model.addAttribute("categorys", categoryServise.findAll());

		return "header";

	}

	@RequestMapping(value = "/footer", method = RequestMethod.GET)
	public String footer(ModelMap model) {

		return "footer";

	}

	@RequestMapping(value = "/head", method = RequestMethod.GET)
	public String head(ModelMap model) {

		return "head";

	}
	
	@RequestMapping(value = "/descriptionpage", method = RequestMethod.GET)
	public String descriptionpage(ModelMap model,@RequestParam("albumID") String albumID) {

		String url = "description";
		getCommonJSP(model);
		try {
			int id = Integer.parseInt(albumID);
			model.addAttribute("album", albumService.findOne(id));
			
		} catch (NumberFormatException e) {
			model.addAttribute("error", "NumberFormatException");
			url = "error";
		} catch (Exception e) {
			model.addAttribute("error", albumID);
			url = "error";
		} finally {
			return url;
		}

	}
	
	@RequestMapping(value = "/categorypage", method = RequestMethod.GET)
	public String categorypage(ModelMap model,@RequestParam("categoryID") String categoryID) {

		String url = "category";
		getCommonJSP(model);
		try {
			logger.debug("start:  SelectObjectByID");
			model.addAttribute("albums", albumService.SelectObjectByID(Integer.parseInt(categoryID)));
			logger.debug("successful:  SelectObjectByID");
		} catch (NumberFormatException e) {
			model.addAttribute("error", "NumberFormatException");
			url = "error";
		} catch (Exception e) {
			model.addAttribute("error", categoryID);
			url = "error";
		} finally {
			return url;
		}

	}
	
	@RequestMapping(value = "/homepage", method = RequestMethod.GET)
	public String homepage(ModelMap model) {

		model.addAttribute("categorys", categoryServise.findAll());
		return "homepage";

	}

	public void getCommonJSP(ModelMap model) {
		model.addAttribute("gethead",FacadeEngine.getHtmlbyURL("head"));
		model.addAttribute("getheader", (String) FacadeEngine.getHtmlbyURL("header"));
		model.addAttribute("getfooter", (String) FacadeEngine.getHtmlbyURL("footer"));
		
		
	}
}
