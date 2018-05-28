package in.fiinfra.prelogin.facade;

import java.util.List;

import in.fiinfra.common.video.model.VideoDetailsJson;
import in.fiinfra.prelogin.service.PreLoginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class PreLoginController 
{
	@Autowired
	PreLoginService videoService;
	
	@RequestMapping(value="/getVideoDetails/{BU}") 
	public @ResponseBody List<VideoDetailsJson> preLoginUrlDetails(@PathVariable("BU") String BU)
	{
		List<VideoDetailsJson> videoDetailsJsons =  videoService.preLoginUrlDetails(BU);
		return videoDetailsJsons;	
	}
}
