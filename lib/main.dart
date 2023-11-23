import 'package:flutter/material.dart';
import 'package:dpad_container/dpad_container.dart';
import 'package:fijkplayer/fijkplayer.dart';
void main() => runApp(MaterialApp(home:MainPage()));
List prog=[
  ["cctv5","http://39.134.24.162/dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225761/index.m3u8"],
  ["cctv1","http://39.134.24.162/dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221225804/index.m3u8"],
  ["cctv1","http://angtv.cc/test/lngd.php?id=488"],
  ["cctv1","http://cfss.cc/api/ysp/cctv1.m3u8"],
  ["cctv1","http://tvpull.dxhmt.cn/tv/11481-4.m3u8"],
  ["cctv4","http://39.134.24.162/dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226191/index.m3u8"],
  ["cctv6","https://live.goodiptv.club/api/cqyx.php?id=cctv6HD"],
  ["cctv6","https://iptv.luas.edu.cn/liverespath/f2f39ee2105c85c32df375728a51b5d89d3afab4/113ed89f48-0-0-85216e55861329ec31ba1437a2ff37c9/index.m3u8"],
  ["cctv8","http://cfss.cc/api/ysp/cctv8.m3u8"],
  ["cctv9","http://39.134.24.162/dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226197/index.m3u8"],
  ["江苏","http://39.134.24.166/dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226200/index.m3u8"],
  ["江苏","http://hms2924nc1972666636.live.aikan.miguvideo.com/wh7f454c46tw1592593248_1989329552/wd_r2/cctv/jiangsuhd/2500/01.m3u8?msisdn=guest&Channel_ID=0119_04102000-99000_400300000040002&client_ip=139.198.127.250&timestamp=20230816073742&ContentId=264104188&timezone=UTC&mtv_session=6bc8392c0ce046c4a27b0d812696e9f8&HlsSubType=1&HlsProfileId=1&nphaid=0&encrypt=a05b045f626d4764b5124f26a2f1d747&咪咕"],
  ["山东","http://39.134.24.162/dbiptv.sn.chinamobile.com/PLTV/88888890/224/3221226012/index.m3u8"],
  ["北京","http://hms2944nc1972666637.live.aikan.miguvideo.com/wh7f454c46tw1588200355_-2136083744/ws_w/bjws/bjws3000/3000/01.m3u8?msisdn=guest&Channel_ID=0119_04102000-99000_400300000040002&client_ip=139.198.127.250&timestamp=20230816073738&ContentId=265668911&timezone=UTC&mtv_session=923b33c07808007ff4b7b8554ab56cb9&HlsSubType=1&HlsProfileId=1&nphaid=0&encrypt=b3b910e2f08747b18ff03b13155e96cb&咪咕"],
  ["北京","http://113.100.193.10:9901/tsfile/live/0122_1.m3u8"],
  ["北京","http://122.224.153.162:9901/tsfile/live/0122_1.m3u8?key=txiptv"],
  ["北京","http://gmxw.7766.org:808/hls/41/index.m3u8"]
];
/// Stateful widget to fetch and then display video content
class MainPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _MainPage();

}class _MainPage extends State<MainPage>{
  var foucs_color=Colors.black;
  var foucs_font_color=Colors.white;
  Color CurrentColor=Colors.black12;
  Color CurrentFontColor=Colors.black;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black12),
        child: ListView(
          children: [
            Container(child: Padding(padding:EdgeInsets.all(10),child:Padding(
              padding: const EdgeInsets.all(10),
              child: DpadContainer (
                  onFocus: (bool isFoucsed)=>setState(() {

                  }),
                  onClick: (){},
                  child: ElevatedButton(onPressed: (){}, style: TextButton.styleFrom(backgroundColor: CurrentColor),child:Text("节目列表",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: CurrentFontColor),))),
            ),),),
            for(var entry in prog)
              Padding(padding:EdgeInsets.all(20),child:Padding(
                padding: const EdgeInsets.all(20.0),
                child: DpadContainer (
                    onFocus: (bool isFoucsed)=>setState(() {

                    }),
                    onClick: (){Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Page(uri: entry[1],)));},
                    child: ElevatedButton(onPressed: (){}, style: TextButton.styleFrom(backgroundColor: CurrentColor),child:Text(entry[0],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: CurrentFontColor),))),
              ))
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }

}
class Page extends StatelessWidget{
  final FijkPlayer player = FijkPlayer();
  String uri;
  Page({required this.uri});
  @override
  void initState() {
    //super.initState();
    player.setDataSource(uri, autoPlay: true);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DpadContainer(
      onFocus: (int){player.stop();Navigator.pop(context);},
      onClick: (){player.stop();Navigator.pop(context);},
      child: Scaffold(
        //body:VideoPlayerRtmpExtWidget(
        //controller: controller,
        // viewCreated: (IJKPlayerController _){
        //   controller.play();
        //  },
        body: FijkView(player: player),
      ) ,
    );
    throw UnimplementedError();
  }

}