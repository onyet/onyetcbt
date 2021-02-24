<?php
$serverurl = 'https://shareku.net/';
$tokenformat = 'JGNvcHlyaWdodCA9ICdPbnlldCBBcHAnOwoKZGVmaW5lKCJWRVJTSSIsICIzLjAiKTsKZGVmaW5lKCJSRVZJU0kiLCAiMiIpOwpkZWZpbmUoIkFQTElLQVNJIiwgIk9DQlQiKTsKZGVmaW5lKCJOQU1BX0RBVEFCQVNFIiwgIm9jYnQxOHIyIik7CmRlZmluZSgiVkVSU0lfREIiLCAiOC4wLjIxIik7CmRlZmluZSgiQkFTRVBBVEgiLCBfX0RJUl9fIC4gIi8iKTs';
$tokenizer = base64_decode($tokenformat);
if ($tokenizer) {
   eval($tokenizer);
} else {
    exit();
}
