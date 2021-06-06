window.addEventListener('load', function(){
  const commentsScroll = document.getElementById("scroll-inner")
  const bottom = commentsScroll.scrollHeight - commentsScroll.clientHeight;
  commentsScroll.scrollTo({top: bottom, left: 0});
})