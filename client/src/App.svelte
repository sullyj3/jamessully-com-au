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
	:root {
		background-color: #ddd;
	}

	#header{
		font-family: "Lato";
		color: #eee;

		background-color: #333;
		height: 200;
		display: grid;
		grid-template: 100% / 4fr 2fr;
	}

	#header-links {
		display: flex;
		align-items: center;
		justify-content: space-around;
	}

	#james-link {
		display: flex;
		align-items: center;
		justify-content: flex-start;
		padding-left: 30px;
	}

	#james-link a, a:hover, a:focus, a:active {
		text-decoration: none;
		color: inherit;
	}

	.logo-link img {
		height: 75px;
	}

</style>

<svelte:head>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
</svelte:head>

<div>
	<div id="header">
		<div id="james-link">
			<a href="/"><h1>James Sully</h1></a>
		</div>
		<div id="header-links">
			<div class="logo-link">
				<a href="https://github.com/sullyj3"><img id="gh-logo" src="images/GitHub-Mark-Light-120px-plus.png"></a>
			</div>
			<div class="logo-link">
				<a href="https://open.spotify.com/artist/0IildnIiMV4ON8bxoDOUF8"><img id="spotify-logo" src="images/Spotify_Icon_RGB_Green.png"></a>
			</div>
		</div>
	</div>
	<div id='random-stuff'>
		<p>the server says: {$hello$}</p>
		<h2>Current time:</h2>
		<p>{$clock$}</p>
	</div>
</div>

