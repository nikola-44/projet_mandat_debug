from django.test import TestCase
from reservations.models import Prestation
from django.urls import reverse, resolve


class TestViews(TestCase):

    def setUp(self):
        Prestation.objects.create(nom="Balayage ou Mèches", prix="40", pour="/", duree="01:30")
        Prestation.objects.create(nom="Brushing", prix="50", pour="Courts", duree="00:30")
        Prestation.objects.create(nom="Brushing", prix="65", pour="Longs", duree="01:00")
        Prestation.objects.create(nom="Chignon", prix="68", pour="Courts", duree="00:45")
        Prestation.objects.create(nom="Chignon", prix="94", pour="Longs", duree="01:15")

    # aide par Michael
    def test_bon_template_appele(self):
        reponse = self.client.get("/reservations/prestations-tdd/")
        self.assertTemplateUsed(reponse, template_name="reservations/admin/prestations-tdd.html")

    # j'ai créé 5 prestations auparavant
    def test_affiche_une_liste(self):
        response = self.client.get('/reservations/prestations-tdd/')
        self.assertTrue(len(response.context['prestations']) > 0)

