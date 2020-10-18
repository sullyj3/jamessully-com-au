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

<div>
	<h1>James Sully</h1>
	<p>the server says: {$hello$}</p>
	<h2>Current time:</h2>
	<p>{$clock$}</p>
	<h3>(There's nothing else here (for now))</h3>
</div>
