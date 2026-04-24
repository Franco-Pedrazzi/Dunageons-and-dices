extends CharacterBody3D
class_name Stats

#DnD stats
@export var FOR=16;
@export var DES=11;
@export var CON=14;
@export var INT=11;
@export var SAB=11;
@export var CAR=15;

#Game Stats inicales (son modificados por los Stats de DnD para formar los finales)
@export var Init_VEL=15;

#Game Stats Finales
var VEL=0;

#Modificadores DnD
var MOD_FOR=0;
var MOD_DES=0;
var MOD_CON=0;
var MOD_INT=0;
var MOD_SAB=0;
var MOD_CAR=0;

func stats_ready() -> void:
	
	MOD_FOR=int((FOR-10)/2);
	MOD_DES=int((DES-10)/2);
	MOD_CON=int((CON-10)/2);
	MOD_INT=int((INT-10)/2);
	MOD_SAB=int((SAB-10)/2);
	MOD_CAR=int((CAR-10)/2);
	
	VEL=Init_VEL+MOD_DES

	
	

@export var clase=""
@export var raza="humano"

@export var exp=0
@export var lv=0
