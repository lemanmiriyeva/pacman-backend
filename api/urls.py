from django.urls import path
from . import views

urlpatterns = [
    path('add_user/', views.add_or_update_user, name='add_user'),
    path('update_score/', views.update_score, name='update_score'),
    path('leaderboard/', views.leaderboard, name='leaderboard'),
    path('user_score/<int:user_id>/', views.get_user_score, name='get_user_score'),
]