(function ($) {
    $(document).ready(function () {
        $(".drop-name-update").on("change", function () {
            var dropId = $(this).data("dropId");
            var dropValue = $(this).val();

            $.ajax({
                type: 'POST',
                url: '/admin/drops/update',
                dataType: 'json',
                data: {
                    'dropId': dropId,
                    'dropValue': dropValue
                },
                beforeSend: function () {
                },
                complete: function () {
                },
                success: function (data) {
                    location.reload();
                }
            });
        });
    });
}(jQuery));