#include "HttpClient.hpp"
#include <iostream>

#include <curl/easy.h>
#include <curl/curlbuild.h>

EzoRed::Http::HttpClient::HttpClient()
{
	curl = curl_easy_init();

	userAgent = "EzoRed::Http::HttpClient";
	verbose = false;
	followLocation = true;
	forbideReuse = false;

	timeout = 30;
	connectTimeout = 30;

	caPath = "";
	caInfo = "";

	sslVersion = CURL_SSLVERSION_DEFAULT;
	sslVerifyPeer = true;
	sslVerifyHost = true;
}

EzoRed::Http::HttpClient::~HttpClient()
{
	if (curl)
	{
		curl_easy_cleanup(curl);
	}
}

void EzoRed::Http::HttpClient::reset()
{
	curl_easy_setopt(curl, CURLOPT_HTTPGET, 0L);
	curl_easy_setopt(curl, CURLOPT_HTTPPOST, 0L);
	curl_easy_setopt(curl, CURLOPT_CUSTOMREQUEST, NULL);
	curl_easy_setopt(curl, CURLOPT_NOBODY, 0L);
}

std::shared_ptr<EzoRed::Http::HttpResponse> EzoRed::Http::HttpClient::doRequest(std::string url)
{
	std::string readBuffer;
	
	curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
	curl_easy_setopt(curl, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);

	curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, HttpClient::writeDataCallback);
	curl_easy_setopt(curl, CURLOPT_WRITEDATA, &readBuffer);

	curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, (followLocation == true ? 1L : 0L));
	curl_easy_setopt(curl, CURLOPT_VERBOSE, (verbose == true ? 1L : 0L));
	curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, (sslVerifyPeer == true ? 1L : 0L));
	curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, (sslVerifyHost == true ? 2L : 0L));
	curl_easy_setopt(curl, CURLOPT_FORBID_REUSE, (forbideReuse == true ? 1L : 0L));
	curl_easy_setopt(curl, CURLOPT_USERAGENT, userAgent.c_str());
	curl_easy_setopt(curl, CURLOPT_TIMEOUT, timeout);
	curl_easy_setopt(curl, CURLOPT_CAPATH, caPath.c_str());
	curl_easy_setopt(curl, CURLOPT_CONNECTTIMEOUT, connectTimeout);
	curl_easy_setopt(curl, CURLOPT_SSLVERSION, sslVersion);

	CURLcode res = curl_easy_perform(curl);

	std::shared_ptr<EzoRed::Http::HttpResponse> response = std::make_shared<EzoRed::Http::HttpResponse>(0, "");

	if (res != CURLE_OK)
	{
		switch (res)
		{
		case CURLE_OPERATION_TIMEDOUT:
			response->code = res;
			response->body = "Operation timeout.";
			break;
		case CURLE_SSL_CERTPROBLEM:
			response->code = res;
			response->body = std::string(curl_easy_strerror(res));
			break;
		default:
			response->code = -1;
			response->body = "Failed to query.";
		}
	}
	else
	{
		int64_t httpCode = 0;
		curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, &httpCode);

		response->code = static_cast<int>(httpCode);
		response->body = readBuffer;
	}

	curl_easy_reset(curl);

	return response;
}

std::shared_ptr<EzoRed::Http::HttpResponse> EzoRed::Http::HttpClient::doGet(std::string url)
{
	reset();

	curl_easy_setopt(curl, CURLOPT_HTTPGET, 1L);

	return doRequest(url);
}

std::shared_ptr<EzoRed::Http::HttpResponse> EzoRed::Http::HttpClient::doPost(std::string url, std::string data)
{
	reset();

	curl_easy_setopt(curl, CURLOPT_POST, 1L);
	curl_easy_setopt(curl, CURLOPT_POSTFIELDS, data.c_str());
	curl_easy_setopt(curl, CURLOPT_POSTFIELDSIZE, data.size());

	return doRequest(url);
}

std::shared_ptr<EzoRed::Http::HttpResponse> EzoRed::Http::HttpClient::doPut(std::string url, std::string data)
{
	reset();
	
	const char *method = "PUT";
	curl_easy_setopt(curl, CURLOPT_CUSTOMREQUEST, method);
	curl_easy_setopt(curl, CURLOPT_POSTFIELDS, data.c_str());
	curl_easy_setopt(curl, CURLOPT_POSTFIELDSIZE, data.size());

	return doRequest(url);
}

std::shared_ptr<EzoRed::Http::HttpResponse> EzoRed::Http::HttpClient::doDelete(std::string url)
{
	reset();

	const char *method = "DELETE";
	curl_easy_setopt(curl, CURLOPT_CUSTOMREQUEST, method);

	return doRequest(url);
}

std::shared_ptr<EzoRed::Http::HttpResponse> EzoRed::Http::HttpClient::doHead(std::string url)
{
	reset();

	const char *method = "HEAD";
	curl_easy_setopt(curl, CURLOPT_CUSTOMREQUEST, method);
	curl_easy_setopt(curl, CURLOPT_NOBODY, 1L);

	return doRequest(url);
}

std::shared_ptr<EzoRed::Http::HttpResponse> EzoRed::Http::HttpClient::doPatch(std::string url)
{
	reset();

	const char *method = "PATCH";
	curl_easy_setopt(curl, CURLOPT_CUSTOMREQUEST, method);

	return doRequest(url);
}

void EzoRed::Http::HttpClient::setSSLVerifyPeer(bool sslVerifyPeer)
{
	this->sslVerifyPeer = sslVerifyPeer;
}

void EzoRed::Http::HttpClient::setSSLVerifyHost(bool sslVerifyHost)
{
	this->sslVerifyHost = sslVerifyHost;
}

void EzoRed::Http::HttpClient::setFollowLocation(bool followLocation)
{
	this->followLocation = followLocation;
}

void EzoRed::Http::HttpClient::setVerbose(bool verbose)
{
	this->verbose = verbose;
}

void EzoRed::Http::HttpClient::setForbideReuse(bool forbideReuse)
{
	this->forbideReuse = forbideReuse;
}

void EzoRed::Http::HttpClient::setTimeout(int timeout)
{
	this->timeout = timeout;
}

void EzoRed::Http::HttpClient::setUserAgent(std::string userAgent)
{
	this->userAgent = userAgent;
}

void EzoRed::Http::HttpClient::setCertificateAuthorityPath(std::string caPath)
{
	this->caPath = caPath;
}

void EzoRed::Http::HttpClient::setConnectTimeout(int connectTimeout)
{
	this->connectTimeout = connectTimeout;
}

void EzoRed::Http::HttpClient::setSSLVersion(int sslVersion)
{
	this->sslVersion = sslVersion;
}

void EzoRed::Http::HttpClient::setCertificateAuthorityInfo(std::string caInfo)
{
	this->caInfo = caInfo;
}

size_t EzoRed::Http::HttpClient::writeDataCallback(void *contents, size_t size, size_t nmemb, void *userdata)
{
	((std::string *)userdata)->append((char *)contents, size * nmemb);
	return (size * nmemb);
}
