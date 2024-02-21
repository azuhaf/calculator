#!/bin/bash
test $(curl 192.168.1.12:8765/sum?a=1\&b=2) -eq 3