import operator

from django.test import TestCase
from compte.models import Client, User
from reservations.models import Prestation, ResPres, Reservation
from django.urls import reverse, resolve


class TestModels(TestCase):

    def setUp(self):
        user = User.objects.create()
        client = Client.objects.create(user=user, nom="nom", prenom="prenom", dateNaissance='1993-05-25', telephone="0256489756", genre="Autre")
        prestation = Prestation.objects.create(nom="Brushing", prix="65", pour="Longs", duree="01:00")
        reservation = Reservation.objects.create(date='2022-01-25', heure='10:00:00', commentaire="commentaire", client=client)
        ResPres.objects.create(reservation=reservation, prestation=prestation)

        prestation2 = Prestation.objects.create(nom="Chignon", prix="94", pour="Longs", duree="01:15")
        reservation2 = Reservation.objects.create(date='2022-01-25', heure='13:00:00', commentaire="commentaire", client=client)
        ResPres.objects.create(reservation=reservation2, prestation=prestation2)

        reservation3 = Reservation.objects.create(date='2022-01-25', heure='14:00:00', commentaire="commentaire", client=client)
        ResPres.objects.create(reservation=reservation3, prestation=prestation2)

        Prestation.objects.create(nom="Balayage ou Mèches", prix="40", pour="/", duree="01:30")
        Prestation.objects.create(nom="Brushing", prix="50", pour="Courts", duree="00:30")
        Prestation.objects.create(nom="Chignon", prix="68", pour="Courts", duree="00:45")

    def test_liste(self):
        response = self.client.get('/reservations/prestations-tdd/')
        self.assertTrue(len(response.context['prestations']) == 5)



