from rest_framework import routers
from accounts import views

accountsRouter = routers.DefaultRouter()
accountsRouter.register(r'accounts',viewset=views.TestViewSet,basename='accounts')