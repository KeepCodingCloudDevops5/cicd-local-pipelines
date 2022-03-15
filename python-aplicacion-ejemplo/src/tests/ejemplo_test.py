import sys
import os

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../aplicacion_ejemplo")))
import ejemplo

def test_add_one():
    assert ejemplo.add_one(3) == 4