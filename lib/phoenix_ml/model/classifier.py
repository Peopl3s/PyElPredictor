import os
import pandas as pd
from joblib import dump, load

def load_model():
    path = os.path.abspath('lib/phoenix_ml/model/apartment.pkl')
    return load(path)  

def predict_model(args):
	
	d = {'floor_in_house': [args[2]], 'surface_per_room': [float(args[3]/args[0])],  'dist':[args[1]]}
	df = pd.DataFrame(data=d)
	rf = load_model()
	return "{0}".format(rf.predict(df)[0])
