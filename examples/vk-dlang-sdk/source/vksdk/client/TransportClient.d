module vksdk.client.TransportClient;

import std.stdio;

import vksdk.client.ClientResponse;

interface TransportClient {

    ClientResponse post(string url, string requestBody);

    ClientResponse post(string url, string fileName, File file);

    ClientResponse post(string url);
}
