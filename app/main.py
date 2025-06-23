from pydantic import BaseModel

class Protocol(BaseModel):
    text: str


def run(text: str):
    return Protocol(text=text).model_dump_json()
