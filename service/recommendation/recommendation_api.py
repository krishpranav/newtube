from fastapi import FastAPI, Query
import numpy as np
import pandas as pd
from sklearn.metrics.pairwise import cosine_similarity

app = FastAPI()

video_embeddings = pd.read_csv("video_embeddings.csv", index_col=0)

@app.get("/recommend")
def recommend(video_id: int, top_k: int = 5):
    if str(video_id) not in video_embeddings.index:
        return {"error": "Video not found"}

    vec = video_embeddings.loc[[str(video_id)]].values
    sims = cosine_similarity(vec, video_embeddings.values)[0]
    top_indices = np.argsort(sims)[::-1][1:top_k+1]
    recs = video_embeddings.index[top_indices].tolist()
    return {"recommended_video_ids": recs}
