from django.test import TestCase
from django.urls import reverse, resolve


class TestUrls(TestCase):
    def test_view_url_exists_at_desired_location(self):
        response = self.client.get('/reservations/prestations-tdd/')
        self.assertEqual(response.status_code, 200)

    def test_view_url_accessible_by_name(self):
        response = self.client.get(reverse('prestations-tdd'))
        self.assertEqual(response.status_code, 200)

