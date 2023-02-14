import os
import tempfile

import pytest

from fp_app import app

def test_main():
    client = app.test_client()
    client = client.get('/')
    assert b'This is main page' in client.data

def test_user():
    client = app.test_client()
    client = client.get('/user')
    assert b'User page' in client.data

def test_about():
    client = app.test_client()
    client = client.get('/about')
    assert b'About page' in client.data