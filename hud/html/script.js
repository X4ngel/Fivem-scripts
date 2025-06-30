window.addEventListener('message', function (event) {
    const data = event.data;

    if (data.action === 'updateTime') {
        document.getElementById('clock').textContent = data.time;
    }

    if (data.action === 'updateBank') {
        document.getElementById('bank').textContent = `€${data.value}`;
    }
});