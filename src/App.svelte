<script>
import { ajax } from "rxjs/ajax";
import { pluck, tap } from "rxjs/operators";
	
const hello$ = ajax(`https://jimmy-echo-server.herokuapp.com/hello`);

</script>

<div>
	<p>The response was: <em>{$hello$}</em></p>
	<p>{console.log($hello$)}</p>
</div>
