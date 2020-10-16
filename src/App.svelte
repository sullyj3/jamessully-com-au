<script lang="ts">
import { ajax } from "rxjs/ajax";
import type { AjaxRequest, AjaxResponse } from "rxjs/ajax";
import { map } from "rxjs/operators";
	
const helloRequest: AjaxRequest = {
	url: 'https://jimmy-echo-server.herokuapp.com/hello',
	headers: {
		'Accept': '*/*',
	},
	responseType: 'text'
}

const hello$ = ajax(helloRequest).pipe(
		map(resp => console.log('resp: ', resp)),
		map((resp: AjaxResponse) => resp.responseText.map(
			obj => JSON.stringify(obj)
		))
	);

let response: string[] = undefined;

hello$.subscribe((strs: string[]) => {
	console.log(`strs: ${strs}`);
	response = strs;
});

</script>

<div>
	<h1>yo</h1>
	{#each $response as respText}
		<p>text: {respText}</p>
	{/each}
</div>
