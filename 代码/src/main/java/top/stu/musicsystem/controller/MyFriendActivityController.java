package top.stu.musicsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import top.stu.musicsystem.model.FriendActivity;
import top.stu.musicsystem.service.MyFriendActivityService;
import top.stu.musicsystem.utils.Request;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class MyFriendActivityController {
    @Autowired
    MyFriendActivityService myFriendActivityService;



    @GetMapping({"myFriendActivityFrameLoad.do"})
    public ModelAndView MyFriendActivityFrameLoad(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("HomePage_Top_myFriendActivityFrame");
        List<FriendActivity> myFriendsActivities = this.myFriendActivityService.getMyFriendsActivities(request);
        modelAndView.addObject("myFriendsActivities", myFriendsActivities);
        return modelAndView;
    }

    @GetMapping(value = "likeFriendActivity.do", produces = "text/plain;charset=UTF-8")
    public String handleFriendActivityLike(HttpServletRequest request, @RequestParam int friendActivityId) {
        String result = myFriendActivityService.toggleLikeStatusOfFriendActivity(request, friendActivityId);
        return result;
    }


    @GetMapping(value = "likeFriendActivityReview.do", produces = "text/plain;charset=UTF-8")
    public String handleFriendActivityReviewLike(HttpServletRequest request, @RequestParam int friendActivityReviewId) {
        String result = myFriendActivityService.toggleLikeStatusOfFriendActivityReview(request, friendActivityReviewId);
        return result;
    }

    @PostMapping(value = "postFriendActivity.do", produces = "text/plain;charset=UTF-8")
    public String handleFriendActivityPost(HttpServletRequest request, @RequestBody String jsonStr) {
        Map<String, String> jsonObject = myFriendActivityService.parseJsonStr(jsonStr);
        String[] result = myFriendActivityService.parseActivityContent(jsonObject.get("activityContent"));
        String songName = result[0];
        String userComment = result[1];
        if (!myFriendActivityService.insertFriendActivity(request, songName, userComment)) {
            return "你@的歌曲:\""+songName+"\"暂未上架\n => 发动态失败";
        }
        return "发动态成功\n" +
                "动态内容为：" + result[1] + "\n" +
                (result[0] == null ? "" : "动态配上的音乐为：" + result[0]);
    }

    @PostMapping(value = "postFriendActivityReview.do", produces = "text/plain;charset=UTF-8")
    public String handleFriendActivityReviewPost(HttpServletRequest request, @RequestBody String jsonStr) {
        Map<String, String> jsonObject = myFriendActivityService.parseJsonStr(jsonStr);
        String userComment = jsonObject.get("activityReviewContent");
        int friendActivityId = Integer.parseInt(jsonObject.get("friendActivityId"));
        myFriendActivityService.insertFriendActivityReview(request, userComment, friendActivityId);
        return "发评论成功\n" +
                "评论内容为：" + userComment + "\n";
    }


}
