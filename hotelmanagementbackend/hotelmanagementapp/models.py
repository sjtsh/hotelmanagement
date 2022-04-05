from django.db import models

# Create your models here.


# class User(models.Model):
#     email = models.EmailField(blank=True, null=True)
#     bank_balance = models.FloatField()
#     is_deactivated = models.BooleanField(default=False)
#     pin_code = models.IntegerField(blank=True, null = True)
#     theme_preference = models.ForeignKey(Theme, on_delete=models.CASCADE)
#     avatar = models.ForeignKey(Avatar, on_delete=models.CASCADE)
#     name = models.TextField()
#     monthly_target_saving = models.FloatField()
#     date_time = models.DateTimeField(auto_now_add=True)
    
#     def __str__(self):