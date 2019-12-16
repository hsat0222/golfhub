// $(document).on('turbolinks:load', function() {
//   $(function() {

//     // セレクトボックスの値が変更されたら発火
//     $('#map-search').change(function() {
//       var year = $(this).val(); // セレクトボックスの値を取得
//       var result_area = $('.history_result');

//       // ajaxによる非同期通信
//       $.ajax({
//         type: 'GET',
//         url: '/records/select_year',
//         data: { keyword: year },
//         dataType: 'json'
//       })
//     });
//   });
// });
