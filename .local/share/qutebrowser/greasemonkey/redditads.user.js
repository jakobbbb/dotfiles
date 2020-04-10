// ==UserScript==
// @name         Remove Promoted Reddit Posts
// @namespace    http://reddit.com/
// @version      2.0
// @description  try to take over the world!
// @author       You
// @match        https://www.reddit.com/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    const promotedPosts = document.getElementsByClassName('promotedlink');
    let totalPosts = 0;

    const hidePromotedPosts = () => {
        if (promotedPosts.length === totalPosts) return;
        totalPosts = promotedPosts.length;
        Array.from(promotedPosts).forEach((post) => {
            post.style.display = 'none';
        });
    };

    hidePromotedPosts();
    document.body.addEventListener('DOMNodeInserted', hidePromotedPosts);
})();
