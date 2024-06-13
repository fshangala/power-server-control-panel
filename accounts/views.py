from django.shortcuts import render
from rest_framework import viewsets
from core.response import GenerateResponse
import os, subprocess

# Create your views here.
class TestViewSet(viewsets.ViewSet):
  def list(self,request):
    cmd = subprocess.run(["dir"],shell=True,capture_output=True,text=True)
    obj = GenerateResponse()
    obj.data = {
      "shell":cmd.stdout
    }
    return obj.response()