from fastapi import FastAPI

app = FastAPI(
    title="OpsPulse",
    description="DevOps Health Dashboard",
    version="1.0.0",
)

@app.get("/")
def home():
    return {
        "message": "Welcome to OpsPulse",
        "application": "DevOps Health Dashboard",
        "version": "1.0.0"
    }

@app.get("/health")
def health():
    return {
        "status": "ok"
    }

@app.get("/ready")
def readiness():
    return {
        "status": "ready"
    }

@app.get("/version")
def version():
    return {
        "application": "OpsPulse",
        "version": "1.0.0"
    }