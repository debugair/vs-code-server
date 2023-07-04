import pandas as pd

class PandasSample:
    def __init__(self):
        self.data = {
            'id': [1, 2, 3],
            'name': ['Smith', 'Johnson', 'Williams'],
            'firstname': ['John', 'Jane', 'Robert']
        }

    def show(self):
        df = pd.DataFrame(self.data)
        print(df.head())