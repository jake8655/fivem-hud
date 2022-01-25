$(() => {
  window.addEventListener('message', e => {
    switch (e.data.type) {
      case 'open':
        $('body').css('opacity', 1);
        $('body').css('transform', 'translateY(0)');
        break;
      case 'close':
        $('body').css('transform', 'translateY(-20px)');
        $('body').css('opacity', 0);
        break;

      case 'update':
        $(document.documentElement).css('--health', e.data.health);
        $(document.documentElement).css('--armor', e.data.armor);
        $(document.documentElement).css('--hunger', e.data.hunger);
        $(document.documentElement).css('--thirst', e.data.thirst);
        $('.time').text(moment().format('HH:mm'));
        $('.player-count').text(e.data.players);
        $('.job').text(`${e.data.job} - ${e.data.grade}`);
        break;
    }
  });
});
