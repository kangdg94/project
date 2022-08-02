package com.example.kangdg.controller;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class FirstController {

    @GetMapping("/hi")//url
    public String niceToMeetYou(Model model){


        model.addAttribute("username","donggeun");
        return "greeting"; //templates/greetings.mustache
    }
    @GetMapping("/bye")
    public String seeYouNext(Model model, String Lolname){
        System.out.println(Lolname);
        String SummonerName = Lolname;
        String api_key = "RGAPI-afdf3aca-0356-45b0-80c6-f17fa1761fc5";
        String requestURL = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"+ SummonerName + "?api_key=" + api_key;
        StringBuffer response = new StringBuffer();
        String id = "";
        String accountId = "";
        String name = "";
        String puuid ="";
        int profileIconId = 0;
        long revisionDate = 0;
        long summonerLevel = 0;
        try {
            URL url = new URL(requestURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            //con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            //StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            String jsonString = response.toString();

            JSONObject jObject = new JSONObject(jsonString);
            id = jObject.getString("id");
            accountId = jObject.getString("accountId");
            puuid = jObject.getString("puuid");
            name = jObject.getString("name");
            profileIconId = jObject.getInt("profileIconId");
            revisionDate = jObject.getLong("revisionDate");
            summonerLevel = jObject.getLong("summonerLevel");

            System.out.println(response.toString());

        } catch (Exception e) {
            System.out.println(e);
        }

        //////////////////////////////////////////////////////////////

        String requestURL2 = "https://asia.api.riotgames.com/tft/match/v1/matches/by-puuid/" + puuid + "/ids?count=20&api_key=" + api_key ;
        ArrayList gameids = new ArrayList();
        StringBuffer response2 = new StringBuffer();


        try {
            URL url = new URL(requestURL2);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");

            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;

            while ((inputLine = br.readLine()) != null) {
                response2.append(inputLine);

            }
            br.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        List<String> list = Arrays.asList(response2.toString().replace("[", "").replace("]", "").replace("\"", "").split(","));
        for(int i=0; i<list.size(); i++){
            System.out.println(list.get(i));
        }
        /////////////////////////////////////////////
        model.addAttribute("nickname",response2.toString());
        return "goodbye";
    }
}
