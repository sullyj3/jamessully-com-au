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
	:global(body) {
		background-color: #ddd;
		margin: 0;
		padding: 0;
	}

	#header{
		font-family: "Lato";
		color: #eee;

		background-color: #333;
		height: 200;
		display: grid;
		grid-template: 100% / 8fr 2fr;
		padding: 0px 25px;
	}

	#header-links {
		display: flex;
		align-items: center;
		justify-content: flex-end;
	}

	.logo-link {
		padding: 0px 10px;
	}

	.logo-link img {
		height: 75px;
	}

	#james-link {
		display: flex;
		align-items: center;
		justify-content: flex-start;
	}

	#james-link a, a:hover, a:focus, a:active {
		text-decoration: none;
		color: inherit;
	}

	#random-stuff {
		height: 100%;
		background-color: #eee;
		margin: 0 150px;
		padding: 20px;
	}

</style>

<svelte:head>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
</svelte:head>

<div id="header">
	<div id="james-link">
		<a href="/"><h1>James Sully</h1></a>
	</div>
	<div id="header-links">
		<div class="logo-link">
			<a href="https://github.com/sullyj3" target="_blank"><img id="gh-logo" src="images/GitHub-Mark-Light-120px-plus.png"></a>
		</div>
		<div class="logo-link">
			<a href="https://open.spotify.com/artist/0IildnIiMV4ON8bxoDOUF8" target="_blank"><img id="spotify-logo" src="images/Spotify_Icon_RGB_Green.png"></a>
		</div>
	</div>
</div>
<div id='random-stuff'>
	<h2>Current time:</h2>
	<p>{$clock$}</p>
	<h3>The server says:</h3>
	<p>{$hello$}</p>
</div>

