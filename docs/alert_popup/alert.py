from django.contrib.auth.decorators import login_required
from django.core.exceptions import PermissionDenied
from django.http import HttpResponseRedirect
from django.shortcuts import redirect, render

from stocks.forms.alert import AlertForm
from stocks.models.price_alert import StockAlert


@login_required
def alerts(request):
    alerts = StockAlert.objects.all().filter(user=request.user)

    ctx = {}
    ctx["page_title"] = "Alerts"
    ctx["alerts"] = alerts
    return render(request, "stocks/alerts.html", context=ctx)


@login_required
def alert(request, alert_id):
    ctx = {}
    ctx["page_title"] = "Alert"
    alert = StockAlert.objects.get(pk=alert_id)

    # permission check
    if alert.user != request.user:
        raise PermissionDenied

    if request.method == "GET":
        # load data into form
        ctx["form"] = AlertForm(instance=alert)

    if request.method == "POST":
        form = AlertForm(request.POST, instance=alert)
        ctx["form"] = form
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("/alerts?saved=yes")

    return render(request, "stocks/alert.html", context=ctx)


@login_required
def new_alert(request):
    alert = StockAlert(user=request.user)
    alert.save()

    return redirect(alert)
