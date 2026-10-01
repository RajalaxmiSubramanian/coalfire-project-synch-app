# Sf Spp Opportunity Synch App

**MuleSoft Integration Project Documentation**

Last updated: 2026-09-16

##  Table of Contents

- [Project Overview](#project-overview)
  - [Project Name](#project-name)
  - [Objective](#objective)
  - [Scope](#scope)
- [High-Level Architecture](#high-level-architecture)
  - [Architecture Style](#architecture-style)
  - [API Layers](#api-layers)
  - [Connectors Used](#connectors-used)
  - [External HTTP Integrations](#external-http-integrations)
- [Key Features](#key-features)
- [Technologies Used](#technologies-used)
- [API Operations Summary](#api-operations-summary)
  - [Health APIs](#health-apis)
- [DataWeave Transformations](#dataweave-transformations)
- [Error Handling](#error-handling)
- [Logging & Monitoring](#logging-monitoring)
  - [Custom Logging Framework](#custom-logging-framework)
- [Security](#security)
- [Deployment & Monitoring](#deployment-monitoring)


---

## Project Overview

### Project Name

Sf Spp Opportunity Synch App


### Objective

Integration from Salesforce to OpenAir using the sync pattern, triggered on schedule (PT1H).


### Scope

- Expose 1 confirmed API endpoint(s): GET /health
- Move data between Salesforce and OpenAir
- Run on schedule: PT1H
- Error handling: on-error-continue
- Send logs/metrics to Anypoint Console
- Enforce oauth2 security




---

## High-Level Architecture

### Architecture Style

API-led Process layer integration (sync) between Salesforce and OpenAir.


### API Layers

- **Process API**: Orchestration layer — composes downstream system calls (Salesforce, NetSuite OpenAir, Email) into business workflows


### Connectors Used

- **HTTP**: listener, listener-config, listener-connection, response, headers, error-response, body, request-config, request-connection, request
- **Salesforce**: sfdc-config, oauth-user-pass-connection, query, salesforce-query, parameters, update, records
- **NetSuite OpenAir**: login-authentication-connection, read, add
- **Email**: smtps-config, smtps-connection, send, body, content


### External HTTP Integrations

- **Openair Soap REST API (via HTTP Connector)** — GET /health
- **Mule Secure Properties REST API (via HTTP Connector)** — GET /health




---

## Key Features

- Read/Retrieve operations
- RESTful API endpoints
- Integration using HTTP Connector, Salesforce, NetSuite OpenAir, Email
- Error handling using Global Error Handlers
- Reusable DataWeave transformations
- Secure credential management
- Comprehensive logging for audit and troubleshooting




---

## Technologies Used

- MuleSoft Anypoint Studio 7.21
- Mule Runtime 4.9.0
- DataWeave 2.0
- HTTP Connector
- Email Connector
- Netsuite Openair Connector
- Salesforce Connector
- MUnit Testing Framework
- Salesforce
- NetSuite OpenAir
- Email
- APIKit Router
- Secure Properties




---

## API Operations Summary

### Health APIs

| Operation | Method | Endpoint |
|-----------|--------|----------|
| List Health | GET | /health |




---

## DataWeave Transformations

#### `openair-customer-transform.dwl` — openair customer transform

_No field mappings parsed from this file._

#### `openair-project-batch-transform.dwl` — openair project batch transform

| Target Field | Transform (DataWeave) |
|--------------|------------------------|
| ArrayOfoaBase | (vars.projectsToCreate map (item, index) -> { oaBase: { ns0#oaProject: { name: item.lineItemRecord.Product2.Name default ("Project-" ++ item.lineItemId), sfid:… |

#### `openair-batch-response-parser.dwl` — openair batch response parser

_No field mappings parsed from this file._

#### `openair-document-transform.dwl` — openair document transform

_No field mappings parsed from this file._

#### `salesforce-writeback-transform.dwl` — salesforce writeback transform

| Target Field | Transform (DataWeave) |
|--------------|------------------------|
| lineItemUpdates[].Id | lineItemId |
| lineItemUpdates[].OpenAir_Project_Id__c | lineItemProjectId default null |
| lineItemUpdates[].spp_Sync_Status__c | if (item.lineItemStatus == "Success") "Processed" else "Failed" |
| opportunityUpdate.Id | vars.opportunityId |
| opportunityUpdate.spp_Sync_Status__c | vars.opportunityStatus |

#### `failure-email-transform.dwl` — failure email transform

_No field mappings parsed from this file._

#### `transform-1.dwl` — transform 1

_No field mappings parsed from this file._

#### `transform-2.dwl` — transform 2

_No field mappings parsed from this file._

#### `transform-3.dwl` — transform 3

_No field mappings parsed from this file._

#### `transform-4.dwl` — transform 4

_No field mappings parsed from this file._

#### `transform-5.dwl` — transform 5

_No field mappings parsed from this file._

#### `transform-6.dwl` — transform 6

| Target Field | Transform (DataWeave) |
|--------------|------------------------|
| Id | vars.opportunityId |
| spp_Sync_Status__c | 'Failed' |

#### `get-health-response-7.dwl` — get health response 7

| Target Field | Transform (DataWeave) |
|--------------|------------------------|
| status | payload.status default null |





---

## Error Handling

| Scenario | Error Code | Message |
|----------|------------|----------|
| Salesforce — connectivity error | 503 | Downstream service unavailable |
| App — sfdc query failed error | 500 | Internal server error |
| Mule — expression error | 500 | Internal server error |
| Mule — connectivity error | 503 | Downstream service unavailable |
| Papi — handled error | N/A | Error of type PAPI:HANDLED |
| Unhandled error (catch-all) | 500 | Unexpected error during request processing |




---

## Logging & Monitoring

#### Custom Logging Framework

- Standardized logging using `common_logger.xml` framework
- Correlation ID tracking across all flows and external requests
- Trace point tracking (`REQUEST_RECEIVED`, `FLOW_ENTRY`, `PROCESS_INFO`, `BEFORE_OUTBOUND`, `AFTER_OUTBOUND`, `FLOW_COMPLETE`, `RESPONSE_RETURNED`, `ERROR`)
- Dynamic log levels based on environment properties (`priority.debug`, `priority.info`, `priority.error`)




---

## Security

- Encrypted configuration values resolved at runtime
- CloudHub load balancer terminates TLS for inbound traffic




---

## Deployment & Monitoring

- Deployed to CloudHub via CI/CD pipeline
- Runtime Monitoring enabled
- Logs sent to centralized logging system
- Health check endpoints configured




---

