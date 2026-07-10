"""FastAPI backend for the AWS e-commerce demo application."""

from pathlib import Path

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import FileResponse
from fastapi.staticfiles import StaticFiles

# Resolve the frontend directory relative to this file.
PROJECT_ROOT = Path(__file__).resolve().parent.parent
FRONTEND_DIR = PROJECT_ROOT / "Frontend"

app = FastAPI(title="AWS E-Commerce Demo", version="1.0.0")
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Mount the images directory so product images can be served directly.
app.mount("/images", StaticFiles(directory=str(FRONTEND_DIR / "images")), name="images")

# In-memory product catalog for demonstration purposes.
PRODUCTS = [
    {
        "id": 1,
        "name": "Gaming Laptop",
        "price": 1299.99,
        "description": "A fast laptop for coding and content creation.",
        "image": "/images/laptop.jpg",
    },
    {
        "id": 2,
        "name": "Smartphone",
        "price": 799.50,
        "description": "A modern phone with a bright display and great battery.",
        "image": "/images/phone.jpg",
    },
    {
        "id": 3,
        "name": "Noise Cancelling Headphones",
        "price": 199.99,
        "description": "Premium audio for work and travel.",
        "image": "/images/headphones.jpg",
    },
    {
        "id": 4,
        "name": "Wireless Keyboard",
        "price": 89.00,
        "description": "Compact keyboard built for comfort.",
        "image": "/images/keyboard.jpg",
    },
    {
        "id": 5,
        "name": "4K Monitor",
        "price": 349.99,
        "description": "Crisp display for multitasking and streaming.",
        "image": "/images/laptop_4k.jpg",
    },
]


@app.get("/")
async def index():
    """Serve the frontend entry page."""
    return FileResponse(FRONTEND_DIR / "index.html")


@app.get("/style.css")
async def style_css():
    """Serve the stylesheet for the frontend."""
    return FileResponse(FRONTEND_DIR / "style.css")


@app.get("/script.js")
async def script_js():
    """Serve the JavaScript file for the frontend."""
    return FileResponse(FRONTEND_DIR / "script.js")


@app.get("/products")
async def products():
    """Return the product list as JSON."""
    return {"products": PRODUCTS, "count": len(PRODUCTS)}


@app.get("/health")
async def health():
    """Simple health-check endpoint for monitoring."""
    return {"status": "ok", "service": "aws-ecommerce-demo"}


if __name__ == "__main__":
    import uvicorn

    uvicorn.run("app:app", host="127.0.0.1", port=5000, reload=True)
