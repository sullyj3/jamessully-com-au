<script lang="ts">
import { ajax } from "rxjs/ajax";
import type { AjaxRequest, AjaxResponse } from "rxjs/ajax";
import { map, startWith } from "rxjs/operators";
import { timer } from "rxjs/index";
	
const helloRequest: AjaxRequest = {
	url: '/api/hello',
	headers: {
		'Accept': '*/*',
	},
	responseType: 'text'
}

const hello$ = ajax(helloRequest).pipe(
	map((resp: AjaxResponse) => resp.response),
	startWith("\(Fetching data...\)"),
);

const clock$ = timer(0, 1000).pipe(
	map(_ => new Date().toString())
);

</script>

<style>
	#header{
		background-color: #666666;
	}

	#gh-logo {
		max-height: 40px;
	}
	#spotify-logo {
		max-height: 40px;
	}
</style>

<div>
	<div id="header">
		<a href="https://github.com/sullyj3"><img id="gh-logo" src="images/GitHub-Mark-Light-120px-plus.png"></a>
		<a href="https://open.spotify.com/artist/0IildnIiMV4ON8bxoDOUF8"><img id="spotify-logo" src="images/Spotify_Icon_RGB_Green.png"></a>
	</div>
	<h1>James Sully</h1>
	<p>the server says: {$hello$}</p>
	<h2>Current time:</h2>
	<p>{$clock$}</p>
</div>

