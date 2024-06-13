from rest_framework.response import Response

class GenerateResponse:
  def __init__(self):
    self.data=dict()
    self.errors=list()
    self.statusCode=200
  
  def response(self):
    return Response(data={
      "data":self.data,
      "errors":self.errors,
    },status=self.statusCode)