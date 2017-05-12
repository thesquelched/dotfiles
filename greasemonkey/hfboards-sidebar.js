// ==UserScript==
// @name        Hide HFBoards Latest Threads
// @namespace   hfboards
// @description Hide the HFBoards "Latest Threads" sidebar
// @include     http://hfboards.hockeysfuture.com/*
// @version     1
// @grant       none
// ==/UserScript==

document.querySelector("table td[valign='top'][align='left']").remove();