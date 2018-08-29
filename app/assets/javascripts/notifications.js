$(document).on('turbolinks:load', function() {
    $(document).ready(function() {
        getNotifications();

        $('#notification_toggle').on('click', function() {
            $('.notifications').toggle()
        });

        $('.notifications_holder').on('click', 'li.notification', function() {
            let notificationId = $(this).attr('data-id');
            $.ajax(
                `/notifications/${notificationId}/mark_as_read`,
                {
                    dataType: "JSON",
                    method: "GET",
                    success: getNotifications
                }
            );
        });
    });

    $('body').on('click', function(e) {
        let notificationHolder = $('.notifications_holder');
        if (!notificationHolder.is(e.target) && notificationHolder.has(e.target).length === 0)
        {
            $('.notifications').hide();
        }
    });
});

function getNotifications() {
    $.ajax(
        "/notifications.json",
        {
            dataType: "JSON",
            method: "GET",
            success: handleSuccess
        }
    );
}

function handleSuccess(data) {
    let counter = 0;
    let notificationItems = data.map((notification) => {
        if (!notification.read_at)
            counter++;
        let className = notification.read_at ? '' : 'new';
        return `<li class='notification ${className}' data-id='${notification.id}'>${notification.action}. 
                Click <a href="${notification.path}">here</a> to view</li>`
    });

    $(".notifications_holder .count").text(counter);
    $(".notifications").html(notificationItems);
}
