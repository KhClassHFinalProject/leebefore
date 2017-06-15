// html5media enables <video> and <audio> tags in all major browsers
//External File: http://api.html5media.info/1.1.8/html5media.min.js


//Add user agent as an attribute on the <html> tag...
//Inspiration: http://css-tricks.com/ie-10-specific-styles/
var b = document.documentElement;
b.setAttribute('data-useragent', navigator.userAgent);
b.setAttribute('data-platform', navigator.platform);

function jsonTest(){
	var supportsAudio = !!document.createElement('audio').canPlayType;
	
	$.ajax({
		type:"GET"
		, url:"audioList.ju"
		, data : {elIdx : elIdx}
		, dataType: "json"
		, success : function(data){
			var idx = data.elIdx;
			console.log(idx);
			var audios= data.audios;
			console.log(audios);
			 if (supportsAudio) {
			     var index = 0,
			         playing = false,
			         mediaPath = '/lee/resources/elib/eAudio/'+idx+'/',
			         extension = '',
			         tracks = audios,				//json 으로 불러옴
			         buildPlaylist = $.each(tracks, function(key, value) {
			             var trackNumber = value.track,
			                 trackName = value.name,
			                 trackLength = value.length;
			             console.log(trackNumber);
			             if (trackNumber.toString().length === 1) {
			                 trackNumber = '0' + trackNumber;
			             } else {
			                 trackNumber = '' + trackNumber;

			             }
			             $('#plList').append('<li><div class="plItem"><div class="plNum">' + trackNumber + '.</div><div class="plTitle">' + trackName + '</div><div class="plLength">' + trackLength + '</div></div></li>');
			         }),
			         trackCount = tracks.length,
			         npAction = $('#npAction'),
			         npTitle = $('#npTitle'),
			         audio = $('#audio1').bind('play', function () {
			             playing = true;
			             npAction.text('Now Playing...');
			         }).bind('pause', function () {
			             playing = false;
			             npAction.text('Paused...');
			             
			         }).bind('ended', function () {
			             npAction.text('Paused...');
			             if ((index + 1) < trackCount) {
			                 index++;
			                 loadTrack(index);
			                 audio.play();
			             } else {
			                 audio.pause();
			                 index = 0;
			                 loadTrack(index);
			             }
			         }).get(0),
			         btnPrev = $('#btnPrev').click(function () {
			             if ((index - 1) > -1) {
			                 index--;
			                 loadTrack(index);
			                 if (playing) {
			                     audio.play();
			                 }
			             } else {
			                 audio.pause();
			                 index = 0;
			                 loadTrack(index);
			             }
			         }),
			         btnNext = $('#btnNext').click(function () {
			             if ((index + 1) < trackCount) {
			                 index++;
			                 loadTrack(index);
			                 if (playing) {
			                     audio.play();
			                 }
			             } else {
			                 audio.pause();
			                 index = 0;
			                 loadTrack(index);
			             }
			         }),
			         li = $('#plList li').click(function () {
			             var id = parseInt($(this).index());
			             if (id !== index) {
			                 playTrack(id);
			             }
			         }),
			         loadTrack = function (id) {
			             $('.plSel').removeClass('plSel');
			             $('#plList li:eq(' + id + ')').addClass('plSel');
			             npTitle.text(tracks[id].name);
			             index = id;
			             audio.src = mediaPath + tracks[id].file + extension;
			         },
			         playTrack = function (id) {
			             loadTrack(id);
			             audio.play();
			         };
			     extension = audio.canPlayType('audio/mpeg') ? '.mp3' : audio.canPlayType('audio/ogg') ? '.ogg' : '';
			     loadTrack(index);
			     console.log(mediaPath);
			 }
			}
		
	});	
}

//HTML5 audio player + playlist controls...
//Inspiration: http://jonhall.info/how_to/create_a_playlist_for_html5_audio
//Mythium Archive: https://archive.org/details/mythium/
jQuery(function ($) {
	
	jsonTest();
});

function getAudioSpeedDown(){
	var test = document.getElementById("audio1");
	test.playbackRate=0.8;
}

function getAudioSpeedNormal(){
	var test = document.getElementById("audio1");
	test.playbackRate=1;
}

function getAudioSpeedUp(){
	var test = document.getElementById("audio1");
	test.playbackRate=1.2;
}

function getAudioTimeAfter(){
	var test = document.getElementById("audio1");
	test.currentTime+=10;
}

function getAudioTimeBefore(){
	var test = document.getElementById("audio1");
	test.currentTime-=10;
}

function getAudioPlay(){
	var test = document.getElementById("audio1");
	test.play();
}

function getAudioPause(){
	var test = document.getElementById("audio1");
	test.pause();
}

