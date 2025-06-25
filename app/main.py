import wit_world

from pydantic import BaseModel


class Protocol(BaseModel):
    text: str


class WitWorld(wit_world.WitWorld):
    def hello(text: str = "meh"):
        return Protocol(text=text).model_dump_json()
