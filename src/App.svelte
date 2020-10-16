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
		map((resp: AjaxResponse) => resp.response),
);

</script>

<div>
	<h1>yo</h1>
		<p>text: {$hello$}</p>
</div>
