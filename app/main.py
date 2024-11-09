from fastapi import FastAPI
from app.config import settings

from contextlib import asynccontextmanager

app = FastAPI(title=settings.PROJECT_NAME)


@asynccontextmanager
async def lifespan(app: FastAPI):
    # Code to run on startup

    # start the watcher
    print(f"Starting {settings.Project_NAME}")

    # create the database
    
    yield
    # Code to run on shutdown
    print("ending")

@app.get("/")
async def read_root():
    return {"message": "Welcome to the Gmail Watch API!"}

