from django.core.management.base import BaseCommand
from stocks.models.fundamental import Fundamental
from stocks.models.index import Index
from stocks.models.index_component import IndexComponent
from stocks.models.price import Price
from stocks.models.stock import Stock


class Command(BaseCommand):
    help = "deletes all rows"

    def handle(self, *args, **options):
        Index.objects.all().delete()
        Stock.objects.all().delete()
        Price.objects.all().delete()
        Fundamental.objects.all().delete()
        IndexComponent.objects.all().delete()
        self.stdout.write(self.style.SUCCESS("Successfully deleted all content"))
