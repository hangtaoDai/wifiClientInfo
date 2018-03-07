package com.wifi.serviceIml;

import com.google.gson.Gson;
import com.wifi.bean.Apmac;
import com.wifi.bean.VO.APmacVO;
import com.wifi.bean.VO.Track;
import com.wifi.dao.OnlineinfoMapper;
import com.wifi.service.OnlineInfoService;
import com.wifi.utils.CoodinateCovertor;
import com.wifi.utils.LngLat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by liyuan on 2018/1/29.
 */
@Service
public class OnlineInfoServiceImpl implements OnlineInfoService {

    @Autowired
    OnlineinfoMapper onlineinfoMapper;

    public String getHotAP(String date) {

        List<HashMap> hotAPBydays = onlineinfoMapper.getHotAPByday(date);

        ArrayList<APmacVO> aPmacVOs = new ArrayList<APmacVO>();

        for (HashMap hotAPByday : hotAPBydays) {
            APmacVO aPmacVO = new APmacVO();
            Apmac apmac = new Apmac();
            Integer ap_id = (Integer) hotAPByday.get("ap_id");
            System.out.println(ap_id);
            apmac.setApId(ap_id);
            String ap_address = (String) hotAPByday.get("ap_address");
            System.out.println(ap_address);
            apmac.setApAddress(ap_address);
            String ap_mac = (String) hotAPByday.get("ap_mac");
            System.out.println(ap_mac);
            apmac.setApMac(ap_mac);
            //ap_longitude,ap_latitude,ap_indoor,
            Double ap_longitude = (Double)hotAPByday.get("ap_longitude");
            Double ap_latitude = (Double) hotAPByday.get("ap_latitude");
            LngLat lngLat = new LngLat(ap_longitude,ap_latitude);
            LngLat lngLatNew = CoodinateCovertor.bd_decrypt(lngLat);
            System.out.println("old lnglat"+ap_longitude+"...."+ap_latitude);
            apmac.setApLongitude(lngLatNew.getLongitude());
            apmac.setApLatitude(lngLatNew.getLantitude());
            System.out.println("new lnglat"+lngLatNew.getLongitude()+"...."+lngLatNew.getLantitude());
            Boolean ap_indoor = (Boolean) hotAPByday.get("ap_indoor");
            System.out.println(ap_indoor);
            apmac.setApIndoor(ap_indoor);
            aPmacVO.setApmac(apmac);
            Long times = (Long) hotAPByday.get("times");
            System.out.println(times);
            aPmacVO.setTimes(times);
            System.out.println(aPmacVO.toString());
            aPmacVOs.add(aPmacVO);

        }


        String str = new Gson().toJson(aPmacVOs);
        System.out.println(str);
        System.out.println(aPmacVOs.size());
        return str;
    }

    public String getTrackByUName(String date, String username) {
        List<HashMap> onlineTrackByUNameList = onlineinfoMapper.getTrackByusername(date, username);
        ArrayList<Track> tracks = new ArrayList<Track>();
        Track track = new Track();
        String start_point = (String) onlineTrackByUNameList.get(0).get("ap_address");
        System.out.println(start_point);
        int num = onlineTrackByUNameList.size();
        String end_point = (String) onlineTrackByUNameList.get(num-1).get("ap_address");
        System.out.println(end_point);
        track.setName(start_point+" -> "+end_point);
        Double[][] path = new Double[num][2];
        for (int i = 0; i < num; i++) {
            Double ap_longitude = (Double)onlineTrackByUNameList.get(i).get("ap_longitude");
            Double ap_latitude = (Double) onlineTrackByUNameList.get(i).get("ap_latitude");
            LngLat lngLat = new LngLat(ap_longitude,ap_latitude);
            LngLat lngLatNew = CoodinateCovertor.bd_decrypt(lngLat);
            path[i][0] = lngLatNew.getLongitude();
            path[i][1] = lngLatNew.getLantitude();
        }
        track.setPath(path);
        tracks.add(track);
        String str = new Gson().toJson(tracks);
        return str;
    }

    public String getTrackByUMac(String date, String usermac) {
        List<HashMap> onlineTrackByUMacList = onlineinfoMapper.getTrackByusermac(date, usermac);
        ArrayList<Track> tracks = new ArrayList<Track>();
        Track track = new Track();
        String start_point = (String) onlineTrackByUMacList.get(0).get("ap_address");
        System.out.println(start_point);
        int num = onlineTrackByUMacList.size();
        String end_point = (String) onlineTrackByUMacList.get(num-1).get("ap_address");
        System.out.println(end_point);
        track.setName(start_point+" -> "+end_point);
        Double[][] path = new Double[num][2];
        for (int i = 0; i < num; i++) {
            Double ap_longitude = (Double)onlineTrackByUMacList.get(i).get("ap_longitude");
            Double ap_latitude = (Double) onlineTrackByUMacList.get(i).get("ap_latitude");
            LngLat lngLat = new LngLat(ap_longitude,ap_latitude);
            LngLat lngLatNew = CoodinateCovertor.bd_decrypt(lngLat);
            path[i][0] = lngLatNew.getLongitude();
            path[i][1] = lngLatNew.getLantitude();
        }
        track.setPath(path);
        tracks.add(track);
        String str = new Gson().toJson(tracks);
        return str;
    }
}
