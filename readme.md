## pydantic with wasm playground

### using whl

```
docker compose build component-use-whl
docker compose up component-use-whl
```

fails with:
```
ModuleNotFoundError: No module named 'pydantic_core._pydantic_core'
```

venv:
```
$ docker compose run --rm component-use-whl ls -l /venv/lib/python3.13/site-packages/pydantic_core/

total 8520
-rw-r--r-- 1 root root    4349 Jun 23 12:43 __init__.py
drwxr-xr-x 1 root root    4096 Jun 23 12:40 __pycache__
-rwxr-xr-x 1 root root 3731806 Jun 23 12:43 _pydantic_core.cpython-313-wasm32-wasi.so
-rwxr-xr-x 1 root root 4772792 Jun 23 12:40 _pydantic_core.cpython-313-x86_64-linux-gnu.so
-rw-r--r-- 1 root root   42722 Jun 23 12:43 _pydantic_core.pyi
-rw-r--r-- 1 root root  151001 Jun 23 12:43 core_schema.py
-rw-r--r-- 1 root root       0 Jun 23 12:43 py.typed
```


### build whl

```
docker compose build component-build-whl
docker compose up component-build-whl
```

fails with the same error
