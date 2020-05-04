<?php
// generate IPv6 from nodeid
// (c) 2017-2020 by Claus Marxmeier
$debug="";
$platform="";
$platform_system="\n";
$platform_web='<BR>';

if (PHP_SAPI === 'cli') {
    $nodeid = $argv[1];
    $platform=$platform_system;
        if ($debug){
          var_dump($argv);
        }
}

else {
    $nodeid = $_GET['nodeid'];
    $platform=$platform_web;
}


if (!$nodeid){
        echo "Please enter nodeid as param! ".$platform.$platform."using default value: 1eb70676ca92.".$platform.$platform;
        $nodeid="1eb70676ca92";
}
// Siegburg
$ipv6_prefix_01="2a03:2260:3017:100:";
$ipv6_prefix_02="2a03:2260:3017:200:";
$ipv6_prefix_05="2a03:2260:3017:500:";

//Lohmar
// 2a03:2260:123:
$ipv6_lohmar_01="2a03:2260:123:100:";
$ipv6_lohmar_03="2a03:2260:123:300:";
$ipv6_lohmar_04="2a03:2260:123:400:";
$ipv6_lohmar_05="2a03:2260:123:500:";
$ipv6_lohmar_07="2a03:2260:123:700:";
$ipv6_lohmar_11="2a03:2260:123:1100:";
$ipv6_lohmar_14="2a03:2260:123:1400:";


// Troisdorf
$ipv6_tdf_prefix_4="2a03:2260:121:4000:";
$ipv6_tdf_prefix_5="2a03:2260:121:5000:";
$ipv6_tdf_prefix_6="2a03:2260:121:6000:";


// Test - lets calculate ipv6 from nodeid
          $firstpart=substr($nodeid,0,2);
          $secondpart=substr($nodeid,2,10);
          $firstdec=hexdec($firstpart);
          $newdec=$firstdec+2;
          $firstdec=dechex($newdec);
          //make sure we have 2 digits - a leading 0 in case if not
          if (strlen($firstdec) < 2){
               $firstdec="0".$firstdec;
            }
            // print "node   : ".$nodeid;
            // print "first  : ".$firstpart;
            // print "second: ".$secondpart;
            // print "<br>";
       // bsp:  2a03:2260:3017:300:
$ipv6=$firstdec.substr($secondpart,0,2).":".substr($secondpart,2,2)."ff:fe".substr($secondpart,4,2).":".substr($secondpart,6,4);
echo $platform;
echo "nodeid    : ".$nodeid.$platform.$platform;
echo $platform;
echo "Supernodes Siegburg:".$platform.$platform;
echo "Innenstadt: ".$ipv6_prefix_01.$ipv6.$platform;
echo "Umland    : ".$ipv6_prefix_02.$ipv6.$platform;
echo "SozNet    : ".$ipv6_prefix_05.$ipv6.$platform;
echo $platform;
echo $platform;
echo "Supernodes Troisdorf:".$platform.$platform;
echo "Innenstadt: ".$ipv6_tdf_prefix_5.$ipv6.$platform;
echo "Umland    : ".$ipv6_tdf_prefix_4.$ipv6.$platform;
echo "Soz. Netze: ".$ipv6_tdf_prefix_6.$ipv6.$platform;
echo $platform;
echo $platform;
echo "Supernodes Lohmar:".$platform.$platform;
echo "Siegburg : ".$ipv6_lohmar_01.$ipv6.$platform;
echo "Lohmar   : ".$ipv6_lohmar_03.$ipv6.$platform;
echo "Sankt Au : ".$ipv6_lohmar_04.$ipv6.$platform;
echo "SozNet   : ".$ipv6_lohmar_05.$ipv6.$platform;
echo "Niederkas: ".$ipv6_lohmar_07.$ipv6.$platform;
echo "Altenkir : ".$ipv6_lohmar_11.$ipv6.$platform;
// echo "Rheinbach: ".$ipv6_prefix_14.$ipv6.$platform;

?>
